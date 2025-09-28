//Name: Alexander Petrov
//PSU account: aop5448

#include <iostream>
#include <vector>
#include <algorithm>

struct Course {
  int id;
  int deadline;
  int value;
  Course(int id, int deadline, int value) : id(id), deadline(deadline), value(value) {}
};

std::vector<Course> courses;

int main(void){

  //Init values
  int thisId, thisDeadline, thisValue;
  int numCourses = 0;
  int numSemesters = 0; //maximum seen semester

  //Read values
  std::cin >> numCourses;
  for(int i=0; i < numCourses; i++){
    std::cin >> thisId;
    std::cin >> thisDeadline;
    std::cin >> thisValue;

    courses.emplace_back(i, thisDeadline, thisValue);

    if(thisDeadline > numSemesters){
      numSemesters = thisDeadline;
    }
  }

  //sort courses by highest value
  std::stable_sort(
    courses.begin(),
    courses.end(),
    [](Course a, Course b){
      return a.value > b.value;
    }
  );

  //Starting from the last semester, greedily pick the highest valid value for that semester
  int totalCourses = 0;
  int totalValue = 0;
  for(int semester=numSemesters-1; semester >= 0; semester--){
    for(int i=0; i<(int)courses.size(); i++){
      if(courses[i].deadline < semester){
        continue;
      }

      totalCourses++;
      totalValue += courses[i].value;
      courses.erase(courses.begin() + i);
      break;
    }

  }

  std::cout << totalCourses << " " << totalValue;

  return 0;
}