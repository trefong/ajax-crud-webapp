var Student = function(name, scores) {
  this.firstName = name;
  this.scores = scores;
};

Student.prototype.averageScore = function(){
  var sum = 0
  for (score of this.scores){
    sum += score
  };
  return Math.floor(sum/this.scores.length)
};

Student.prototype.letterGrade = function(){
  if (this.averageScore() >= 90) {
    return "A"
  }
  else if (this.averageScore() >= 80) {
    return "B"
  }
  else if (this.averageScore() >= 70) {
    return "C"
  }
  else if (this.averageScore() >= 60) {
    return "D"
  }
  else {
    return "F"
  }

};