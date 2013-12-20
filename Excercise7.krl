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

  rule initialize {
    select when pageview url re#.*#
    pre {
      blank_div = << <div id="my_div"></div> >>;
    }
    notify("Hello Example", blank_div)
      with sticky=true;
  }

  rule show_form
  {
    pre {
      a_form = <<
        <form id="my_form" onsubmit="return false">
        <input type="test" name="first" />
        <input type="test" name="last" />
        <input type="submit" value="Submit" />
        </form>
      >>;
    }
  }
}
