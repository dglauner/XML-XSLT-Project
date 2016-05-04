declare variable $col := collection('courses');

<departments>
   {
      for $d in ($col/courses/course/department)
      let $name := ($d/dept_short_name)
      let $code := ($d/@code)
      group by $name, $code
      order  by $name, $code
      return
      <department code="{$code}">{$name}</department>
   }
</departments>

