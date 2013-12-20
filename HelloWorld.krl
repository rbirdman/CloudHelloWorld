ruleset HelloWorldApp {
  meta {
    name "Hello World"
    description <<
      Hello World
    >>
    author "Ryan Bird"
    logging off
    use module a169x701 alias CloudRain
    use module a41x196 alias SquareTag
  }
  dispatch {
  }
  global {
  }
  rule HelloWorld is active {
    select when web cloudAppSelected
    pre {
        my_html = <<
            <h5>Hello, World! Match Professor's outline</h5>
        >>;
    }
    {
        SquareTag:inject_styling();
        CloudRain:createLoadPanel("Hello World", {}, my_html);
        alert("Stuff");
        notify("This is a notification","This is subtext");
    }
  }
}
