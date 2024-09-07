#Spec: {
	app:                  #AcceptableAppName
	semantic_versioning?: bool
	description:          string
	environment: [...#Environment]
	channels: [...#Channels]
}

#Channels: {
	name:    #AcceptableChannelName
	primary: bool
	platforms: [...#AcceptedPlatforms]
	stable: bool
	tests: {
		enabled: bool
		type?:   #AcceptedTestTypes
	}
}

#Environment: {
	[string]: string | bool | int
}

#AcceptableAppName:     string & !="" & =~"^[a-zA-Z0-9_-]+$"
#AcceptableChannelName: string & !="" & =~"^[a-zA-Z0-9._-]+$"
#AcceptedPlatforms:     "linux/amd64" | "linux/arm64"
#AcceptedTestTypes:     "cli" | "web"
