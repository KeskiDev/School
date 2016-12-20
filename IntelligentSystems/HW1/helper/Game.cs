using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Problem1
{
    public class Game
    {
        private List<State> stateList = new List<State>();
        private List<State> stateHasBeenUsed = new List<State>();

        public void gameLoop(int m, int c)
        {
            State initial = new State();
            initial.mLeft = m;
            initial.cLeft = c;
            initial.mRight = 0;
            initial.cRight = 0;
            stateList.Add(initial);
            stateHasBeenUsed.Add(initial);

            while (true)
            {
                if (stateList.Count == 0)
                {
                    Console.WriteLine("Problem with " + m + " missionaries and " + c + " cannibals cannot be solved.");
                    return;

                }
                if (goal(stateList.ElementAt(0).mRight, stateList.ElementAt(0).cRight))
                    return;

                addNewStates(stateList.ElementAt(0).boatLocation);

                stateList.RemoveAt(0);
            }
        }

        //public void gameLoop(int m, int c)
        //{
        //    while (true)
        //    {
        //        if (goal(m, c))
        //            return;

        //        addNewStates(stateList.ElementAt(0).boatLocation, m, c);

        //        stateList.RemoveAt(0);
        //    }
        //}

        private bool goal(int m, int c) {
            //if (stateList.Count == 0)
            //{
            //    Console.WriteLine("Problem cannot be solved.");
            //    return true;
            //}
            if (stateList.ElementAt(0).mLeft == 0 && stateList.ElementAt(0).cLeft == 0)
            {
                Console.WriteLine("Problem with " + m + " missionaries and " + c + " cannibals was solved in " + stateList.ElementAt(0).pathLength + " moves.");
                Console.WriteLine("Path included: \n" + stateList.ElementAt(0).path);
                return true;
            }
            return false;
        }

        private void addNewStates(string boatSide) {
            State newState = new State() { boatLocation = boatSide};

            newState = nextMove(1, 0);
            if (isValid(newState))
                addToLists(newState);

            newState = nextMove(2, 0);
            if (isValid(newState))
                addToLists(newState);

            newState = nextMove(1, 1);
            if (isValid(newState))
                addToLists(newState);

            newState = nextMove(0, 1);
            if (isValid(newState))
                addToLists(newState);

            newState = nextMove(0, 2);
            if (isValid(newState))
                addToLists(newState);

        }

        private void addToLists(State s)
        {
            stateList.Add(s);
            stateHasBeenUsed.Add(s);
        }

        private State nextMove(int m, int c) {
            State newState = new State() { mLeft = stateList.ElementAt(0).mLeft,
                                           mRight = stateList.ElementAt(0).mRight,
                                           cLeft = stateList.ElementAt(0).cLeft,
                                           cRight = stateList.ElementAt(0).cRight,
                                           path = stateList.ElementAt(0).path,
                                           pathLength = stateList.ElementAt(0).pathLength,
                                           boatLocation = stateList.ElementAt(0).boatLocation
            };

            string ss = "";
            ss += "Move " + m + " missionaries and " + c + " cannibals across to the ";

            if (newState.boatLocation == "Left")
            {
                newState.mLeft -= m;
                newState.cLeft -= c;
                newState.mRight += m;
                newState.cRight += c;
                
                ss += "right ";
            } else
            {
                newState.mLeft += m;
                newState.cLeft += c;
                newState.mRight -= m;
                newState.cRight -= c;
                
                ss += "left ";
            }

            if (newState.boatLocation == "Left")
                newState.boatLocation = "Right";
            else
                newState.boatLocation = "Left";

            ss += "shore.";
            newState.path += ss + "\n";
            ++newState.pathLength;

            return newState;
        }

        private bool isValid(State s)
        {
            if (checkIfStateHasBeenUsed(s))
                return false;

            if (s.mLeft > 0)
                if (s.mLeft < s.cLeft)
                    return false;

            if (s.mRight > 0)
                if (s.mRight < s.cRight)
                    return false;

            if (s.mLeft < 0 || s.mRight < 0 || s.cLeft < 0 || s.cRight < 0)
                return false;

            return true;
        }

        private bool checkIfStateHasBeenUsed(State s)
        {
            for (var i = 0; i < stateHasBeenUsed.Count(); i++)
            {
                if (s.mLeft == stateHasBeenUsed.ElementAt(i).mLeft &&
                    s.mRight == stateHasBeenUsed.ElementAt(i).mRight &&
                    s.cLeft == stateHasBeenUsed.ElementAt(i).cLeft &&
                    s.cRight == stateHasBeenUsed.ElementAt(i).cRight &&
                    s.boatLocation == stateHasBeenUsed.ElementAt(i).boatLocation)
                    return true;
            }
            return false;
        }
    }
}
