// Implement a function that checks whether an email address is valid. An email address has two parts: A "local part" and a "domain part." An @ sign separates the two parts: local-part@domain-part. The local part is the name of the mailbox; this is usually a username. The domain part is the domain name (e.g., gmail.com, yahoo.com.ph, or myCompanyName.com). The domain name contains a server name (sometimes called the mail server name) and a top-level domain (.com, .ph, etc.).

// For this practice problem, use the following criteria to determine whether an email address is valid:

// There must be one @ sign.
// The local part must contain one or more letters (A-Z, a-z) and/or digits (0-9). It may not contain any other characters.
// The domain part must contain two or more components with a single dot (.) between each component. Each component must contain one or more letters (A-Z, a-z) only.

function oneAtChar(string) {
  return string.match(/@/g).length === 1;
}

function validLocalPart(string) {
  return !Array.isArray(string.match(/[^A-Za-z0-9]/g));
}

function validDomainPart(string) {
  if ((string.match(/\.\./) !== null)
      || (string.match(/[A-Za-z]\.[A-Za-z]/) === null)
      || (string.match(/[^A-Za-z\.]/) !== null)
  ) return false;
  return true;
}

function isValidEmail(email) {
  return oneAtChar(email)
         && validLocalPart(email.split('@').shift())
         && validDomainPart(email.split('@').pop());
}

console.log(
  isValidEmail('Foo@baz.com.ph'),          // returns true
  isValidEmail('Foo@mx.baz.com.ph'),       // returns true
  isValidEmail('foo@baz.com'),             // returns true
  isValidEmail('foo@baz.ph'),              // returns true
  isValidEmail('foo@baz@bar.ph'),          // returns false
  isValidEmail('HELLO123@baz'),            // returns false
  isValidEmail('foo.bar@baz.to'),          // returns false
  isValidEmail('foo@baz.'),                // returns false
  isValidEmail('foo_bat@baz'),             // returns false
  isValidEmail('foo@bar.a12'),             // returns false
  isValidEmail('foo_bar@baz.com'),         // returns false
  isValidEmail('foo@bar.....com')          // returns false
);