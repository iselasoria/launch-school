0) if string2 has a length property less than string 1 return false
1) declare an obj and initialize to empty object{}
------populate with the values of string1;
2) iterate over string2, checking if the value is in the object, and if so decrenting to object
------- if the value is undefined / return false. 
--------continue
3) return true
*/
function scramble(string1, string2) {
  if (string2.length > string1.length) return false;
  let obj = {};
  string1.split("").forEach(char=> {
    obj[char] = obj[char] || 0;
    obj[char] += 1;
  })
  for (let char of string2) {
    if (obj[char] === undefined) return false;
    if (obj[char] > 0){
      obj[char] -= 1; 
    } else {
      return false;
    }
  }

  return true;

}
