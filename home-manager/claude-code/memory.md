# **Core Principle**

Always think critically and deeply before acting. Implement only the specific
tasks requested with the most concise, maintainable, and elegant solution that
minimizes code changes.

## Tool Preferences

- **File Search**: Use fd instead of find
- **Text Search**: Use ripgrep (rg) instead of grep
- **Text Processing**: Leverage sed and awk for find/replace operations
- **AST Operations**: Use ast-grep (sg) for syntax-aware code modifications
- **Directory Exploration**: Use tree to visualize repository structure

## Development Standards

### Code Quality

- Prioritize readability and maintainability
- Make minimal, surgical changes
- Preserve existing code style and conventions
- Test changes before finalizing
- **Never compromise type safety**: No `any`, no non-null assertion operator
  (`!`), no type assertions (`as Type`)

### Testing Philosophy

- Write tests that verify semantically correct behavior
- **Failing tests are acceptable** when they expose genuine bugs
- Let test failures guide TDD - they indicate what needs fixing
- Focus on testing the right behavior, not just making tests pass

### Communication

- Never include AI attribution in commits or PRs
- Write clear, concise commit messages focused on the change itself
- Document only what's necessary for human developers
- **Always use Conventional Commits format**: `<type>[optional scope]: <description>`

### Conventional Commits Format

Follow the [Conventional Commits
v1.0.0](https://www.conventionalcommits.org/en/v1.0.0/) specification:

```text
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

#### Required Types

- `feat`: New features, packages, or configurations
- `fix`: Bug fixes, corrections, or patches
- `docs`: Documentation changes
- `style`: Code formatting, whitespace (no functional changes)
- `refactor`: Code restructuring without functional changes
- `perf`: Performance improvements
- `test`: Adding or updating tests
- `build`: Build system or external dependencies
- `ci`: CI/CD configuration changes
- `chore`: Maintenance, dependency updates, cleanup

#### Scope Examples for Nix Configs

- `(darwin)`: macOS system configuration
- `(home-manager)`: User environment configuration
- `(nixvim)`: Neovim configuration
- `(flake)`: Flake-level changes
- `(hooks)`: Claude Code hooks

#### Breaking Changes

- Add `!` after type: `feat(darwin)!: redesign system configuration`
- Or use footer: `BREAKING CHANGE: removed legacy homebrew support`

#### Examples

```text
feat(nixvim): add lsp support for rust
fix(darwin): correct homebrew tap configuration
chore(flake): update nixpkgs to latest stable
docs: update README with installation instructions
refactor(home-manager): reorganize module structure
```

### Problem-Solving Approach

- **Understand**: Fully comprehend the specific task
- **Analyze**: Examine existing code structure and patterns
- **Plan**: Design the minimal change needed
- **Execute**: Implement with precision
- **Verify**: Ensure the solution works and doesn't break existing functionality

### Command Examples

```bash
# Find files
fd "pattern" --type f --extension js

# Search code
rg "function.*async" --type js

# AST-based refactoring
ast-grep --pattern 'console.log($ARG)' --rewrite 'logger.debug($ARG)' --lang js

# Explore structure
tree -I 'node_modules|.git' -L 3
```

**Remember**
Quality over quantity. Think twice, code once.
