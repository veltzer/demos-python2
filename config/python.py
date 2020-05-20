import config.project

package_name = config.project.project_name

console_scripts = [
]

setup_requires = [
]

run_requires = [
    'gcloud',
    # 'mysqlclient',
    'configparser',
    # 'mysql-connector',
    'pygraph',
    'pandas',
    'numpy',
    'keyring',
    'dbus-python',
    'texttable',
    'python-jenkins',
    'yattag',
    'pybitbucket',
    'gitpython',
]

test_requires = [
]

dev_requires = [
    'pydmt',  # for building
]

install_requires = list(setup_requires)
install_requires.extend(run_requires)

python_requires = ">=3.5"
