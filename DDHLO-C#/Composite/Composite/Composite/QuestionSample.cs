using System;
using System.Collections.Generic;
using System.Text;

namespace Composite
{
    class QuestionSample : IQuestion
    {
        private List<IQuestion> Questions = new List<IQuestion>();
        public void Add(IQuestion question)
        {
            Questions.Add(question);
        }
        public void Ask()
        {
            foreach(IQuestion question in Questions)
            {
                question.Ask();
            }
        }
    }
}
