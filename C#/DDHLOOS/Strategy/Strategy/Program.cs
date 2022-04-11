using System;
using System.Collections.Generic;
using System.Text;

namespace Strategy
{
    class Program
    {
        static void Main(string[] args)
        {
            Sorter mySorter = new Sorter();
            mySorter.SetAlgorithm(new InsertionSort());
            List<int> myList = new List<int>() { 6, 2, 3, 5, 1 };
            myList = mySorter.Sort(myList);
            foreach (int i in myList) Console.WriteLine(i);
        }
    }
}
