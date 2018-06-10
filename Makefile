all:
	swig -python -py3 -c++ demo.i
	c++ -std=c++14 -c demo_wrap.cxx -I/usr/local/Cellar/python/3.6.5/Frameworks/Python.framework/Versions/3.6/include/python3.6m
	c++ -shared demo_wrap.o -o _demo.so -L/usr/local/Cellar/python/3.6.5/Frameworks/Python.framework/Versions/3.6/lib -lpython3.6m
