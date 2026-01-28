---
title: "DSP Is (Not) Easier Than You Think"
date: 2024-02-06T09:50:31-07:00
draft: true
---

This article is about my first steps into DSP using Rust, mainly audio, and the challenges as well as the things I learned along the way.

# DSP

DSP stands for Digital Signal Processing, which is a general term for processing signals whether they be audio, or other forms of sensor output.
You may have heard of low/high pass filters, equalizers, audio compression. All these things are part of DSP

# Challenges

If you haven't thoroughly thought about it, audio processing might seem pretty simple.

Low-pass filter? Well, just iterate through all the samples of audio and then if there are any samples that... if there is a sample that is... wait... Samples don't contain frequency data, they just contain amplitudes. Frequency is found over a span of time...

On top of that, when are you ever listening to one frequency at a time? Think of chords on an instrument, or a band with drums, guitar, and bass all at the same time. In reality, just one person singing has not just one single frequency. In fact, their voice is the summation of the different harmonic frequencies captured all at once. 

Things get complicated quite quickly.

Digital audio, and just audio in general is a very complex thing that we often take for granted.

# Goal #1: Implement Mu-Law Encoding

Implementing an encoding algorithm is a great place to start understanding how digitial audio works. For me, I started with Mu-Law encoding when I wanted to add interactive phone call features to the product I was working on.

# What Is Mu-Law?

Mu-Law is the audio format used in the US and Japan for telecommunications. Its specifications are outlined in the ITU-T standards G.711. A-Law, its evil twin brother, is used in Europe and most other parts of the world.

Mu-Law and A-Law are companding algorithms. This means that they are compressed, then when played back are expanded through the inverse of the compression. However, there is no free lunch in DSP. Both of these algorithms are lossy in nature.

These companding algorithms are used for telephony because they work well within the human hearing and human speech range. They work by reducing the dynamic range of amplitudes, but not linearly, in an effort to reduce the Signal To Noise Ratio (SNR). Beacuse the way humans percieve loudness is logarithmic (the decibel system reflects this), we can compress the amplitudes logarithmically. Additionally, because of the logarithmic nature of the compression, we can give more data to softer amplitudes that are important for speech.

[The wikipedia page for mu-law](https://en.wikipedia.org/wiki/%CE%9C-law_algorithm) is a great place to start understanding the more nuanced aspects of this algorithm.

# Implementation

Implementation of Mu-Law compression wildly varies from all of the different examples that I could find.

In the end, I decided that I would implement the C version found in ITU-T standards G.711 in Rust because at the time I was working on this, Rust was our primary language for backend services and to this date, it is still the only time I've ever needed to use bitwise operations in a real world scenario.

```rust
fn mulaw_encode_sample(input: i16) -> u8 {
    // Find absolute magnitude and add bias
    let mut sample = if input < 0 {
        (!input >> 2) + BIAS
    } else {
        (input >> 2) + BIAS
    };

    // Add clipping
    if sample > CLIP {
        sample = CLIP;
    }

    // Find exponent
    let mut i = sample >> 6;
    let mut segno = 1;
    while i != 0 {
        segno += 1;
        i >>= 1;
    }

    // high-nibble
    let high_nibble = (0x0008) - segno;

    // low-nibble
    let low_nibble = (0x000F) - ((sample >> segno) & (0x000F));

    // Join nibbles together
    if input >= 0 {
        ((high_nibble << 4) | low_nibble | (0x0080)) as u8
    } else {
        ((high_nibble << 4) | low_nibble) as u8
    }
}
```

Here you can see the encoding of a single sample which takes one 16-bit signed integer and returns one 8-bit unsigned integer as the new encoded sample.

First, we find the absolute magnitude of the sample (ie. positive or negative), reduce the resolution to 14-bit and add a bias to make sure that we preserve quieter sounds.
We'll then clip the sample to be in the range of 0 to 






