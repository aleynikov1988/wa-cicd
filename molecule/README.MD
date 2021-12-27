# Ansible: molecule, testinfra

### Install ansible-lint

[Docs](https://ansible-lint.readthedocs.io/en/latest/usage.html)

````
sudo apt install ansible-lint
pip install "ansible-lint[community,yamllint]"
````

### Install yamllint

[Docs](https://yamllint.readthedocs.io/en/stable/)

````
sudo apt install yamllint
````

### Install molecule

[Docs](https://molecule.readthedocs.io/en/latest/)

````
sudo pip install --upgrade pip
pip install molecule[ansible-2.10]
pip install molecule[docker]
pip install pytest-testinfra
````
