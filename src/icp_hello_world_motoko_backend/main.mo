import HashMap "mo:base/HashMap";
import Text "mo:base/Text";
import Nat "mo:base/Nat";

actor {

  type Student = {
    firstName : Text;
    lastName : Text;
    age : Nat;
    active : Bool;
  };

  let students = HashMap.HashMap<Text, Student>(5, Text.equal, Text.hash);

  public func createStudent(firstName : Text, lastName : Text, age : Nat, active : Bool) : async () {
    let student = {
      firstName = firstName;
      lastName = lastName;
      age = age;
      active = active;
    };

    students.put(firstName, student);
  };

  public query func getStudentByKey(key : Text) : async ?Student {
    return students.get(key);
  };


  public func deleteStudentByKey(key : Text) : async () {
    students.delete(key);
  };


  public func updateStudent(firstName : Text, lastName : Text, age : Nat, active : Bool) : async ?Student {
    let newStudent = {
      firstName = firstName;
      lastName = lastName;
      age = age;
      active = active;
    };

    return students.replace(firstName, newStudent);
  };

};
