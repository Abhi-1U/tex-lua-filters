return {
  {
    RawInline = function (raw)
      local pkg_name = raw.text:match '\\pkg{([^ ]+)}'
      if raw.format == 'latex' and pkg_name then
        return pandoc.Str(pkg_name)
      end
    end
  }
}

