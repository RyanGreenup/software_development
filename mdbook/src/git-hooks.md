# Git Hooks

- Formatting
    - Linters
        ```sh
        # .git/hooks/pre-commit
        #!/bin/sh
        npm run lint
        if [ $? -ne 0 ]; then
          echo "Linting failed, commit aborted."
          exit 1
        fi
        ```
    - Enforcing Code Style
        ```sh
        # .git/hooks/pre-commit
        #!/bin/sh
        black .
        if [ $? -ne 0 ]; then
          echo "Code Formatting Failed. Commit aborted."
          exit 1
        fi
        ```
    - Enforcing Conventional Commit Message
        ```sh
        # .git/hooks/commit-msg
        #!/bin/sh
        COMMIT_MSG_FILE=$1
        if ! grep -q -E "^(feat|fix|docs|style|refactor|test|chore):" "$COMMIT_MSG_FILE"; then
          echo "Commit message does not follow Conventional Commit format. Commit aborted."
          exit 1
        fi
        ```
- Run Tests
     ```sh
     # .git/hooks/pre-push
     #!/bin/sh
     pytest
     if [ $? -ne 0 ]; then
       echo "Tests failed, push aborted."
       exit 1
     fi
     ```
- Notification Systems
    ```sh
    # .git/hooks/post-commit
    #!/bin/sh
    COMMIT_HASH=`git rev-parse HEAD`
    AUTHOR=`git log -1 --pretty=format:'%an'`
    COMMIT_MSG=`git log -1 --pretty=format:'%s'`
    SLACK_WEBHOOK_URL="https://hooks.slack.com/services/YOUR/WEBHOOK/URL"
    curl -X POST -H 'Content-type: application/json' --data "{
      \"text\": \"New commit by $AUTHOR: $COMMIT_MSG ($COMMIT_HASH)\"
    }" $SLACK_WEBHOOK_URL
    ```
- Check for Secrets
    ```sh
    # .git/hooks/pre-push
    #!/bin/sh
    SECRET_TOOL_CMD="detect-secrets scan"
    $SECRET_TOOL_CMD
    grep "My_API_Key" -r . && \
        echo "Secrets detected, push aborted." && \
        exit 1
    ```
