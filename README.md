# aws-ami

We want to regularly create AMIs of our EC2 instances.
We have the big problem that ami creation takes a very long time.
The problem seems to be not the image build process itself but
the ebs snapshot creation afterwards.

Especially, the windows version is very slow.

## Example

Here are minimal examples for windows and linux.
Both examples don't actutally install anything, the idea
is to have a minimal example that shows the problem.

```
packer init .
packer build --timestamp-ui maigl_win.pkr.hcl
```

## Help, please help

What options do we have to speed up the process?

## References

https://docs.aws.amazon.com/ebs/latest/userguide/ebs-snapshots.html
https://repost.aws/knowledge-center/ebs-snapshot-ec2-ami-creation-slow
