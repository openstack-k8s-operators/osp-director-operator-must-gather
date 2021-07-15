
FROM quay.io/openshift/origin-must-gather:4.3.0 as builder

FROM centos:7

RUN yum update -y && yum install rsync -y && yum clean all

COPY --from=builder /usr/bin/oc /usr/bin/oc

# Save original gather script
COPY --from=builder /usr/bin/gather /usr/bin/gather_original

# Copy all collection scripts to /usr/bin
COPY collection-scripts/* /usr/bin/

ENTRYPOINT /usr/bin/gather