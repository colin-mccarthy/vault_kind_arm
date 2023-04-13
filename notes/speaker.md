Hey in this demo, we're going to walk through the Kubernetes integration that allows applications with no native vault 
logic built in to leverage static and dynamic secrets sourced from vault. 

This is made possible through a new tool called Vault Key eight, which leverages the Kubernetes mutating admission web hook to 
intercept and augment or change, specifically annotated pod configuration for secrets injection. 

So we thought it would be cool to sort of walk through three demos with a cluster where this fault key eats integration 
is enabled, where we can inject secrets into running pods, using both init and sidecar containers. And so the intention here is to gradually 
build up our understanding of what's happening under the hood here. 

Alright, let's jump over to the command line and get started. So before we dive into the demos, I wanted to show you how things are configured that
makes all this work. This should really come in handy if you wanted to play around with this feature yourself. So we'll just cover some initial 
setup steps for a minute. I'm running a three node Kubernetes cluster here on Google's GK. This cluster doesn't have vault or the Vault Key eats 
tool installed yet. So let's just quickly do that. 

The recommended installation method for all this is to use the latest vault Helm chart, which now supports the Vault Key injection functionality. I've already downloaded this behind the scenes. So let's configure a demo namespace and set 
our context to it. And we'll install vault using the vault Helm chart, which I already downloaded. As you can see, I'm setting the vault Helm 
chart to use dev mode, which can come in really handy when you're playing around with stuff like this, since you don't have to set a lot of stuff up.
Alright, so we have vault up and running along with our vault injection web service. Behind the scenes here, this injection service registered itself 
with Kubernetes as a mutating admission, web hook that will intercept and change specifically annotated pod configuration for secrets injection. 
We'll chat more about this in just a minute.

Let's connect to vault and we're going to go through some setup steps, we're going to 
configure a policy named apt for this demo. This is a very non restrictive policy and in production setting, you'd likely lock this down a 
little bit more. But since this is an example, it's more than adequate. Next, we want to configure the vault Kubernetes off method and attach our 
newly created policy for our application service account. We'll also chat about that in just a second. 

We're setting a token, the host and our 
certificates. The reason why we're doing this is so that vault can communicate with Kubernetes. So that we can do policy enforcement for basically
what applications can read what secrets. Alright, the final piece of setup here is we want to create an example username and password involved. The 
end goal here is that this username and password will be injected into our target pods file system, which knows nothing about ball. I know this
might be a little bit of a roundabout way of showing you the demos, but I rather show you how the setup works so that if you're trying to do this 
on your own, you'd have a much better understanding and can just get it to work. Alright, so everything's configured now we can finally run through
our demos. So first of all, launch an example application. Next, we'll patch that application to inject our secret data. Then we'll look at how you 
can use templates to format that data. And finally, we'll look at how you can run background jobs with secrets injection to. So here's our example 
app configuration file for our running demo application. This just bonds a simple web server container useful for testing purposes, we're also 
defining a service account here that we can tie back to the vault policy we created earlier. This allows you to specify which applications are 
allowed to access which secrets. This is sort of a link between specifying which applications on the Kubernetes side can access secrets on vault 
side. So this is really useful. Alright, so let's create this application. And you can see it created our service account to so in our demo 
application, let's just verify there's no secrets mounted at slash vault slash secrets. Great. You can see there isn't as it aired out. So how 
do we actually inject secrets into this already running pod? Well, here's an annotation patch that we can apply to our running pod configuration 
that sets a few vault specific annotations in this pod configuration for injecting our Hello World vault secrets. So we're saying Let's inject the 
vault agent, tell it what secret we want to inject, and then specifying a role that maps to our Kubernetes service account. This service account 
links to the vault policy. This is an important piece here in that you can specify which applications can pull down which vault secrets so you can
basically enforce a policy that says hey, you know what, this application can only access the secrets. Next, let's apply the patch file goes 
correctly. We should see a temp Fs mount under vault slash secrets and a Hello World secret contained in there. So what how And here is that 
when we apply the patch our Vault Key eats webhook intercepted and changed the pod definition, and included the init and pre populated our secret. 
And a vault agent sidecar was also launched to keep this secret data in sync throughout the lifecycle of this application. But you might notice 
that the secret isn't formatted. It's just a go struct export of our secret data. Obviously, this is problematic if you want to take advantage 
of it through your legacy application or something like that. So you almost certainly want to output this in a particular format for consumption 
by your application. So what's the solution for that? Well, you can format the secret data by leveraging the vault agent template feature, which 
is very useful for dealing with these various output formatting requirements. So in the next example, here, you can see this template patch,
where we're going to parse our secret data into a Postgres connection string, these templates can come in extremely handy to save fit your 
various use cases where you need to conform to some pre existing, say configuration file format or something like that. Behind the scenes here, 
we're just using the gold template language so you can do tons of stuff with it. Alright, so let's jump back to the console. So just like before, 
we're going to apply this patch. Down here you can see the application is restarting are in it and sidecar containers are coming up. By the way, 
I should probably mention what this init container is doing. Init container is pre populating the secret data in your application container 
before your application fires up. So when your application starts the secrets already there. Then the sidecar is periodically syncing that secret 
data into the shared temp Fs file system. The reason why we're using this init container is it's really useful to have this data already exists when 
your application boots so that it doesn't error out or something like that. So you can see our connection string here. So the two examples here 
cover a pretty straightforward workflow pattern for injecting secrets into containers that have no native vault logic built in, the applications 
only need to concern themselves with finding the secret in a file system. That's it. So for the final demo, I wanted to show you what a job might 
look like that only uses init containers to pre populate secret data. You'll notice the same logic here with the exception of this pre populate 
annotation that says we only want to use an init container. So there will be no sidecar container running that it's keeping the secret data in sync 
over a long period of time. The example use case here is maybe you have a background job where you want to run PG dump on a regular schedule. And 
you want to inject secrets when the job starts just using the Alpine image. And we're going to dump their connection string to the console. But you 
can obviously use this job specification as sort of a pattern for running your own jobs. Alright, so let's jump back to the console and actually run 
this cool, it worked. Let's take a look at the logs and hopefully you all see a connection string in here. Awesome. So hopefully this helps paint a
pretty good picture of how this new integration works and how you can use these annotations to configure secret injection with vault and Kubernetes. 
So please check out the blog post.


