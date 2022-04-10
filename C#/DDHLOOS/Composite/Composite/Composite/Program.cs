using System;
using System.Collections.Generic;

namespace Composite
{
    class Program
    {
        static void Main(string[] args)
        {
            ClosedEndedQuestion q1 = new ClosedEndedQuestion("Choose the correct answer: non-accelerated motion means that the acceleration ",
                1, new List<string>() { "is undefined", "is always equal to zero", "neither increases nor decreases", "can be equal to any value" });
            OpenEndedQuestion q2 = new OpenEndedQuestion("Write down Newton's laws of motion:", 2);
            OpenEndedQuestion q3 = new OpenEndedQuestion("Derive the formula for gravitational potential energy:", 3);
            QuestionSample s1 = new QuestionSample();
            s1.Add(q1);
            s1.Add(q2);
            s1.Add(q3);
            s1.Ask();

        }
    }
}
