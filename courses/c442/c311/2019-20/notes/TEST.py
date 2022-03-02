client = quip.QuipClient(access_token="Y1FGQU1BV3JLRHA=|1615100608|HlTFGpzn1yTyELDWeC2pob2cfDMcrm+v0gx/aRcyPzM=")
user = client.get_authenticated_user()
starred = client.get_folder(user["starred_folder_id"])
print "There are", len(starred["children"]), "items in your starred folder"
