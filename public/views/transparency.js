var example1;

example1 = {
  hello: "Hello!",
  hi: "<i>Hi there!</i>",
  span: "Goodbye!"
};

var example2;

example2 = [
  {
    date: '2011-08-23',
    activity: 'Jogging',
    comment: 'Early morning run',
    name: 'Harry Potter'
  }, {
    date: '2011-09-04',
    activity: 'Gym',
    comment: 'Chest workout',
    name: 'Batman'
  }
];

var example3;

example3 = {
  title: 'Hello World',
  post: 'Hi there it is me',
  comments: [
    {
      name: 'John',
      text: 'That rules'
    }, {
      name: 'Arnold',
      text: 'Great post!'
    }
  ]
};

var example4;

example4 = {
  firstname: 'John',
  lastname: 'Wayne',
  address: {
    street: '4th Street',
    city: 'San Francisco',
    zip: 94199
  }
};

//#########################################

var directives, person;

person = {
  firstname: 'Jasmine',
  lastname: 'Taylor',
  email: 'jasmine.tailor@example.com'
};

directives = {
  name: {
    html: function() {
      return "<b style='color: #ff0000'>" + this.firstname + " " + this.lastname + "</b>";
    }
  },
  email: {
    href: function() {
      return "mailto:" + this.email;
    }
  }
};

//##############################################

var directives1, nameDecorator, person1;

person1 = {
  firstname: 'Jasmine',
  lastname: 'Taylor',
  email: 'jasmine.taylor@example.com',
  friends: [
    {
      firstname: 'John',
      lastname: 'Mayer',
      email: 'john.mayer@example.com'
    }, {
      firstname: 'Damien',
      lastname: 'Rice',
      email: 'damien.rice@example.com'
    }
  ]
};

nameDecorator = function() {
  return "" + this.firstname + " " + this.lastname;
};

directives1 = {
  name: {
    text: nameDecorator
  },
  friends: {
    name: {
      text: nameDecorator
    }
  }
};

$(document).ready(function(){
    $('.example1').render(example1);
    $('.example2').render(example2);
    $('.example3').render(example3);
    $(".example4").render(example4);

    $('.person').render(person, directives);
    $('.person1').render(person1, directives1);
});

