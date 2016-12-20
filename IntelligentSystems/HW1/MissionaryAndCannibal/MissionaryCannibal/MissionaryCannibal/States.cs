using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MissionaryCannibal
{
    public class States : Movements
    {
        public int missionaryLeft { get; set; }
        public int missionaryRight { get; set; }

        public int cannibalLeft { get; set; }
        public int cannibalRight { get; set; }

        public int crossesLength = 0;
        public string cross;
        public string boatLocation = "Left";
    }
}
