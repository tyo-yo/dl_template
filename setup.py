from setuptools import setup, find_packages

readme = './README.md'
license = './LICENSE'

setup(
    name='mymodule',
    version='0.0.1',
    description='This is sample package!',
    long_description=readme,
    author='Tomoaki Nakamura',
    author_email='nakamura213tomoaki@gmail.com',
    install_requires=['numpy'],
    url='https://github.com/taro/SamplePackage',
    license=license,
    packages=find_packages()
)
