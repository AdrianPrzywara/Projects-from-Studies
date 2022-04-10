using System;
using System.Collections.Generic;
using System.Text;

namespace Composite
{
    public class OpenEndedQuestion : IQuestion
    {
        public string Question { get; private set; }
        public int Points { get; private set; }
        public OpenEndedQuestion(string question, int points)
        {
            Question = question;
            Points = points;
        }
        public void Ask()
        {
            Console.WriteLine("(" + Points + " pkt) " + Question);
            Console.WriteLine("\n\n\n");
        }
    }
}
