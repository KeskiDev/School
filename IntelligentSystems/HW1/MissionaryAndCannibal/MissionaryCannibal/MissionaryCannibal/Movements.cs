using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MissionaryCannibal
{
    public class Movements 
    {
        public List<States> statesList = new List<States>();
        public List<States> visitedStates = new List<States>();

        public void driverLoop(int miss, int cann)
        {
            States beginning = new States();
            beginning.missionaryLeft = miss;
            beginning.missionaryRight = 0;

            beginning.cannibalLeft = cann;
            beginning.cannibalRight = 0;

            statesList.Add(beginning);
            visitedStates.Add(beginning);

            while (true)
            {
                if (statesList.Count == 0)
                {
                    Console.WriteLine(miss + " and " + cann + " can't be solved");
                    return;
                }
                else if (goal(statesList.ElementAt(0).missionaryRight, statesList.ElementAt(0).cannibalRight)){
                    return;
                }

                addNewState(statesList.ElementAt(0).boatLocation);
                statesList.RemoveAt(0);
            }
        }

        public bool goal(int miss, int cann)
        {
            if (statesList.ElementAt(0).missionaryLeft == 0 && statesList.ElementAt(0).cannibalLeft == 0)
            {
                Console.WriteLine("Missionaries: " + miss + " Cannibals: " + cann);
                Console.WriteLine("Steps taken " + statesList.ElementAt(0).cross);
                Console.WriteLine("Number of crosses taken was: " + statesList.ElementAt(0).crossesLength);
                return true;
            }
            return false;
        }

        public void addNewState(string sideOfBoat)
        {
            States newState = new States()
            {
                boatLocation = sideOfBoat
            };

            newState = nextMove(1, 0);
            if (isValid(newState))
            {
                addToList(newState);
            }

            newState = nextMove(1, 1);
            if (isValid(newState))
            {
                addToList(newState);
            }

            newState = nextMove(2, 0);
            if (isValid(newState))
            {
                addToList(newState);
            }

            newState = nextMove(0, 1);
            if (isValid(newState))
            {
                addToList(newState);
            }

            newState = nextMove(0, 2);
            if (isValid(newState))
            {
                addToList(newState);
            }

        }

        public void addToList(States state)
        {
            statesList.Add(state);
            visitedStates.Add(state);
        }

        public States nextMove(int miss, int cann)
        {
            States newState = new States()
            {
                missionaryLeft = statesList.ElementAt(0).missionaryLeft,
                missionaryRight = statesList.ElementAt(0).missionaryRight,

                cannibalLeft = statesList.ElementAt(0).cannibalLeft,
                cannibalRight = statesList.ElementAt(0).cannibalRight,

                cross = statesList.ElementAt(0).cross,
                crossesLength = statesList.ElementAt(0).crossesLength,
                boatLocation = statesList.ElementAt(0).boatLocation
            };

            string stateString = "";
            stateString += "Moving " + miss + " missionaries and " + cann + " cannibals across to the";

            if(newState.boatLocation == "Left")
            {
                newState.missionaryLeft -= miss;
                newState.missionaryRight += miss;

                newState.cannibalLeft -= cann;
                newState.cannibalRight += cann;

                stateString += " right side";
            }
            else
            {
                newState.missionaryLeft += miss;
                newState.missionaryRight -= miss;

                newState.cannibalLeft += cann;
                newState.cannibalRight -= cann;

                stateString += " left side";
            }

            if(newState.boatLocation == "Left")
            {
                newState.boatLocation = "Right";
            }
            else
            {
                newState.boatLocation = "Left";
            }

            newState.cross += stateString + "\n";
            ++newState.crossesLength;

            return newState;
        }

        public bool isValid(States state)
        {
            if (hasStateBeenUsed(state))
            {
                return false;
            }

            //are there more cannibals of left bank
            if(state.missionaryLeft > 0)
            {
                if(state.missionaryLeft < state.cannibalLeft)
                {
                    return false;
                }
            }
            //are there more cannibals on the right bank
            if(state.missionaryRight > 0)
            {
                if(state.missionaryRight < state.cannibalRight)
                {
                    return false;
                }
            }

            if(state.missionaryLeft < 0 || state.missionaryRight < 0 || state.cannibalLeft < 0 || state.cannibalRight < 0)
            {
                return false;
            }

            return true;
        }

        public bool hasStateBeenUsed(States state)
        {
            for(int i=0; i<visitedStates.Count(); i++)
            {
                if(state.missionaryLeft == visitedStates.ElementAt(i).missionaryLeft &&
                    state.missionaryRight == visitedStates.ElementAt(i).missionaryRight &&
                    state.cannibalLeft == visitedStates.ElementAt(i).cannibalLeft &&
                    state.cannibalRight == visitedStates.ElementAt(i).cannibalRight &&
                    state.boatLocation == visitedStates.ElementAt(i).boatLocation)
                {
                    return true;
                }
            }
            return false;
        }

    }
}
