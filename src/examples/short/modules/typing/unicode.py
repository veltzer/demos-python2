"""
This example shows that in python2 the 'Text' type is
an alias to the 'unicode' built-in type. In python3 the
same type is an alias to the 'str' built-in type.

References:
- https://docs.python.org/3/library/typing.html#typing.Text
"""

import typing

assert typing.Text == unicode
