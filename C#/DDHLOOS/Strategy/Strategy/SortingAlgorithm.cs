using System;
using System.Collections.Generic;
using System.Text;

namespace Strategy
{
    public abstract class SortingAlgorithm
    {
        abstract public List<int> Sort(List<int> list);
    }

}
