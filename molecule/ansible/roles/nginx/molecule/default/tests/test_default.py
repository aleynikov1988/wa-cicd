# This suppresses about 80% of the deprecation warnings
import warnings
with warnings.catch_warnings():
    warnings.filterwarnings("ignore", category=DeprecationWarning)
    import os
    import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')

def test_nginx_user(host):
    os = host.system_info.distribution
    if os == 'redhat':
        user = host.user('nginx')
        assert user.exists
        assert user.shell == '/sbin/nologin'
        assert user.home == '/var/cach/nginx'
        assert user.group == 'nginx'
    elif os == 'debian':
        user = host.user('www-data')
        assert user.exists
        assert user.shell == '/sbin/nologin'
        assert user.home == '/var/www'
        assert user.group == 'www-data'        
