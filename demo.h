#include <functional>

struct Demo
{
    void registerFunc(std::function<bool(int)> f)
    {
        func = std::move(f);
    }

    bool execute()
    {
        return func(42);
    }
    
    std::function<bool(int)> func;
};
