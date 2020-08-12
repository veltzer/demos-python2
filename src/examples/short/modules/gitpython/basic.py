"""
List all remote branches of a git repo

References:
- https://stackoverflow.com/questions/2473035/checkout-or-list-remote-branches-in-gitpython
"""

from git import Repo

repo_path = "git@bitbucket.org:shopymate/shopymate.git"
r = Repo(repo_path)
repo_heads = r.heads
repo_heads_names = [h.name for h in repo_heads]
