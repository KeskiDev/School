using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MissionaryCannibal
{
    class Program
    {
        static void Main(string[] args)
        {
            //test 1
            int missionaries = 3;
            int cannibals = 3;
            Movements test1 = new Movements();
            test1.driverLoop(missionaries, cannibals);

            //test 2
            missionaries = 5;
            cannibals = 4;
            Movements test2 = new Movements();
            test2.driverLoop(missionaries, cannibals);
            Console.WriteLine();

            //test 3
            missionaries = 8;
            cannibals = 8;
            Movements test3 = new Movements();
            test2.driverLoop(missionaries, cannibals);
            Console.WriteLine();

            //test 4
            missionaries = 3;
            cannibals = 6;
            Movements test4 = new Movements();
            test4.driverLoop(missionaries, cannibals);
            Console.WriteLine();

            //test 5
            missionaries = 9;
            cannibals = 9;
            Movements test5 = new Movements();
            test5.driverLoop(missionaries, cannibals);
            Console.WriteLine();

            //test 6
            missionaries = 10;
            cannibals = 10;
            Movements test6 = new Movements();
            test6.driverLoop(missionaries, cannibals);
            Console.WriteLine();
            Console.ReadLine();
        }
    }
}
