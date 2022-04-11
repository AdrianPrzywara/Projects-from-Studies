using System;
using System.Collections.Generic;
using System.Text;

namespace Strategy
{
    public class Sorter
    {
        private SortingAlgorithm algorithm;
        public void SetAlgorithm(SortingAlgorithm _algorithm)
        {
            algorithm = _algorithm;
        }
        public List<int> Sort(List<int> list)
        {
            return algorithm.Sort(list);
        }
    }
}
