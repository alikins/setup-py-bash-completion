from setuptools import setup


# this doesn't actually do anything, it's
# just a placeholder to make testing easier
# no point in installing this
setup(
    name="setup-py-bash-completion",
    license="GPLv3",
    version='1.0',
    description="bash completion for setup.py",
    author="Adrian Likins",
    author_email="alikins@redhat.com",
    url="http://github.com/alikins/setup-py-bash-completion",
    classifiers=[
        "Environment :: Console",
        "Intended Audience :: Developers",
        "Programming Language :: Python",
        "Programming Language :: Python :: 2",
    ],
)
