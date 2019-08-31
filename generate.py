import yaml


# Load the list of users
users = yaml.load(open("users.yaml"), Loader=yaml.FullLoader)
out = []

# Create an entry in deployspec for each user
for user in users["Users"]:
  template = yaml.load(open("template.yaml"), Loader=yaml.FullLoader)
  template["params"]["parameters"]["Username"] = user
  template["params"]["stack_name"] = template["params"]["stack_name"]+"-"+user.replace("_", "-").lower()
  out.append(template)

with open("deployspec.yaml", "w+") as f:
  stream = yaml.dump(out, default_flow_style = False)
  f.write(stream.replace('\n- ', '\n\n- '))

