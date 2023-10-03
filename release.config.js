module.export = {
branches: "master",
repositoryUrl: "https://github.com/BensGits/tickets.git",
plugins: [
"@semantic-release/commit-analyzer",
"@semantic-release/release-notes-generator",
"@semantic-release/git",
"@semantic-release/github"]
}