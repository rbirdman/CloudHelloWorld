ruleset HelloWorldApp {

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
    select when pageview url #.*#
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
