// We have the following Array of information for some popular bands. There are problems with this data, though, so we first have to clean it up before we can use it:
// The band countries are wrong: all the bands should have 'Canada' as the country.
// The band name should have all words capitalized.
// Remove all dots from the band names.

// Write a function that can process the input band Array and return an Array that contains the fixed information:

let bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];

function capitalize(string) {
  return string.split(' ')
               .map(word => word[0]
               .toUpperCase() + word.slice(1))
               .join(' ');
}

function cleanString(string) {
  return string.replaceAll('.', '');
}

function sanitizeBandName(name) {
  return capitalize(cleanString(name));
}

function setCounrty(country) {
  return 'Canada';
}

function processBands(data) {
  return data.map( band => {
    return {
      name: sanitizeBandName(band.name),
      country: setCounrty(band.country),
      active: band.active,
    }
  })
}

console.log(processBands(bands));

// should return:
[
  { name: 'Sunset Rubdown', country: 'Canada', active: false },
  { name: 'Women', country: 'Canada', active: false },
  { name: 'A Silver Mt Zion', country: 'Canada', active: true },
]