var Classroom = function(students) {
  this.students = students;
};

Classroom.prototype.find = function(name){
  for(student of this.students){
    if(student.firstName === name){
      return student;
    };
  };
};

Classroom.prototype.honorRollStudents = function(){
  var honorRoll = [];
  for(student of this.students){
    if (student.averageScore() >= 95){
      honorRoll.push(student);
    };
  };
  return honorRoll
};