# Lazygit Configuration

A custom configuration for **Lazygit** featuring an AI-assisted git workflow.

## Custom Commands

### AI Commit Message Helper (`Ctrl + a`)

A custom command mapped to `Ctrl + a` in the files panel that automatically generates Conventional Commit messages based on your staged changes.

#### Workflow:
1. Gathers staged diff contents (`git diff --cached`).
2. Feeds the diff to the local AI prompt wrapper `agy`.
3. The AI generates 10 Conventional Commit messages adhering to formatting rules: `<type>(<scope>): <description>`.
4. Renders the suggestions in an interactive `fzf` panel with a preview.
5. Once selected, opens the commit message in your default `$EDITOR` (e.g., Helix or Vim) for final adjustments.
6. Executes the commit if the file contains text.
