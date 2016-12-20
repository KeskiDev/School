using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Problem1
{
    public class State : Game
    {
        public int mLeft { get; set; }
        public int mRight { get; set; }
        public int cLeft { get; set; }
        public int cRight { get; set; }
        public int pathLength = 0;
        public string path;
        public string boatLocation = "Left";
    }
}
