-- DO NOT change this file untill you know what are you doing.
return {
      image = "{{image}}",
      <* for name, value in colors *>
          {{name}} = "0xff{{value.default.hex_stripped}}",
        <* endfor *>
}
