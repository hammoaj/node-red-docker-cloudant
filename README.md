### Node-RED on the IBM CIO Cirrus platform

This repository is an example Node-RED application that can be deployed into
IBM CIO Cirrus platform with only a couple clicks.

### Setting up on IBM Cirrus

Fork this repository to create a new repository on https://github.ibm.com.

Go to the Cirrus home page (https://brokered.ciocloudservices.ibm.com/projects) and create a new project.

Enter the project you just created, click on the *Builds* tab, and create a new build which uses the repository you just created. Ensure the build, builds correctly.

Click on the *Secrets* tab and create a new Secrets file. Secrets created in the file will get passed in to the Node-RED application as environment variables.

Once you have ensure that the build has completed correctly, click on the *Deployments* and create a new deployment which uses the build you just created. Enter the application name and route (this will be your URL) and enter the correct container port (unless you have changed it in the settings file, this will be 1880). Choose the Secrets file you created in the last step. Deploy and check the runtime log

### Using Cloudant as your file store

By default, this uses a local filestore at `/data` which should be mounted as persistent
storage. 

You can use Cloudant as your filestore by setting the full URL of a Cloudant instance in
a Secrets file.

- Create a new Cloudant instance on IBM Cloud and create a set of credentials
- In the credentials file, there will be an entry for *url*, make a note of the full URL
- In Cirrus, click on the *Secrets* tab and add a new secret to the file you created earlier:
   Secret name: `NODE_RED_STORAGE_URL`
   Secret value: URL from the Cloudant credentials file
- Redeploy the application

It includes a set of default flows that are automatically deployed the first time
Node-RED runs.

### Customising Node-RED

This repository is here to be cloned, modified and re-used to allow anyone create
their own Node-RED based application that can be quickly deployed to IBM Cloud.

The default flows are stored in the `defaults` directory in the file called `flow.json`.
When the application is first started, this flow is copied to the attached Cloudant
instance. When a change is deployed from the editor, the version in cloudant will
be updated - not this file.

The web content you get when you go to the application's URL is stored under the
`public` directory.

Additional nodes can be added to the `package.json` file and all other Node-RED
configuration settings can be set in `cirrus-settings.js`.


### Environment Variables

The following environment variables can be set in the Secrets file to configure the application:

 - `NODE_RED_STORAGE_URL` - the full Cloudant URL for the Cloudant service to be used
 - `NODE_RED_STORAGE_DB_NAME` - the name of the database to use on Cloudant
 - `NODE_RED_STORAGE_APP_NAME` - the prefix used in document names, allowing multiple instances
    to share the same database.
 - `NODE_RED_USERNAME`, `NODE_RED_PASSWORD` - if set, used to secure the editor
 - `NODE_RED_GUEST_ACCESS` - if the editor is secured, this will allow anonymous,
    read-only access
