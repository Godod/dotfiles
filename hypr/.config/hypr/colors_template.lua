-- DO NOT change this file untill you know what are you doing.
-- Change border colors by matugen
return {
      image = "{{image}}",
      <* for name, value in colors *>
          {{name}} = "0xff{{value.default.hex_stripped}}",
        <* endfor *>
}
