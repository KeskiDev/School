using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Problem1
{
    class Program
    {
        static void Main(string[] args)
        {
            var numMiss = 3;
            var numCann = 3;
            Game game = new Game();
            game.gameLoop(numMiss, numCann);
            Console.WriteLine("\n");
            numMiss = 5;
            numCann = 5;
            Game game2 = new Game();
            game2.gameLoop(numMiss, numCann);
            Console.WriteLine("\n");
            numMiss = 2;
            numCann = 3;
            Game game3 = new Game();
            game3.gameLoop(numMiss, numCann);

            Console.ReadLine();
        }
    }
}
