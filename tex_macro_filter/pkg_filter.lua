return {
  {
    RawInline = function (raw)
      local formula = raw.text:match '\\pkg{([^ ]+)}'
      if raw.format == 'latex' and formula then
        return pandoc.Str(formula)
      end
    end
  }
}

