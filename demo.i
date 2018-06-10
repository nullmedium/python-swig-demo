%typemap(in) std::function {
    auto callback = [$input](auto&&... params) {
       PyGILState_STATE state = PyGILState_Ensure();

       PyObject* result =  PyObject_CallFunctionObjArgs($input,makePyObject(std::forward<decltype(params)>(params))..., NULL);
       int retVal = -1;

       if (result)
       {
           retVal = PyObject_IsTrue(result);
           Py_DECREF(result);
       }

       PyGILState_Release(state);
       return retVal == 1;
   };
   $1 = std::move(callback);
}

%module demo
%{
    #include "demo.h"

    PyObject* makePyObject(int val)
    {
        return Py_BuildValue("i", val);
    }
%}

%include "demo.h"
