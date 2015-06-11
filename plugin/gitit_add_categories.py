import vim
import re

try:
    category_to_add = vim.eval("a:category")
    cat_pattern = "categories: (.*)"
    buffer_head = "\n".join(vim.current.buffer[0:6])
    match = re.search(cat_pattern, buffer_head)

    if match:
        categories = match.group(1).split(", ")
        categories.append(category_to_add)
        categories = ", ".join(sorted(set(categories)))
        cmd = "%s/\\v^categories: .*$/categories: " + categories + "/"
        vim.command(cmd)
    else:
        print("Please insert a YAML block at the top of the file")
        # vim.current.buffer.append("---")
        # vim.current.buffer.append("categories: " + category_to_add)
        # vim.current.buffer.append("...")
        # vim.current.buffer.append("")
        # vim.current.buffer[0] = "top line"

except:
    # raise
    print("Did not successfully add the category")
