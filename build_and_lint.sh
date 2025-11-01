#!/bin/bash

# --- Install PHP and extensions if not present ---
if ! command -v php &> /dev/null
then
    echo "[INFO] PHP not found. Installing..."
    sudo apt-get update
    sudo apt-get install -y php-cli php-mbstring php-curl php-xml php-zip
fi

MAX_RETRIES=10
COUNT=1
SUCCESS=false
BACKUP_DIR="backup_build_lint_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

echo "[INFO] Starting PHP Build & Lint Auto-Fix Workflow"

# --- Install Composer if not present ---
if [ ! -f "composer.phar" ]; then
    echo "[INFO] Composer not found. Installing..."
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php -r "if (hash_file('sha344', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); exit(1); } echo PHP_EOL;"
    php composer-setup.php
    php -r "unlink('composer-setup.php');"
fi

while [ $COUNT -le $MAX_RETRIES ]; do
    echo "----------------------------------------"
    echo "Attempt $COUNT / $MAX_RETRIES"
    echo "----------------------------------------"

    # --- Step 1: Backup current project ---
    tar -czf "$BACKUP_DIR/backup_attempt_$COUNT.tar.gz" --exclude=$BACKUP_DIR .

    # --- Step 2: Clean & install dependencies ---
    rm -rf vendor composer.lock
    php composer.phar install

    # --- Step 3: Run lint & tests ---
    LINT_OUTPUT=$(vendor/bin/php-cs-fixer fix --dry-run --diff 2>&1)
    TEST_OUTPUT=$(vendor/bin/phpunit 2>&1)

    echo "$LINT_OUTPUT"
    echo "$TEST_OUTPUT"

    # --- Step 4: Analyze errors ---
    ERRORS=$(echo -e "$LINT_OUTPUT\n$TEST_OUTPUT" | grep -E "FAILURES!|Errors:|PHP Parse error")
    if [ -z "$ERRORS" ]; then
        echo "[SUCCESS] Build & Lint passed successfully!"
        SUCCESS=true
        break
    fi

    echo "[INFO] Errors detected. Attempting auto-fixes..."

    # --- Step 5: Automatic fixes ---
    vendor/bin/php-cs-fixer fix

    COUNT=$((COUNT+1))
done

# --- Step 6: Final summary ---
if [ "$SUCCESS" = false ]; then
    echo "[ERROR] Build & Lint could not be fixed after $MAX_RETRIES attempts."
    echo "[INFO] Check backups in $BACKUP_DIR for project state during failures."
else
    echo "[INFO] Build & Lint process completed successfully."
fi
