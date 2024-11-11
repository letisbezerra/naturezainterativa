//
//  Module.swift
//  VisionOS_Test
//
//  Created by Ana Flávia Torres do Carmo on 06/11/24.
//

import Foundation

/// A description of the modules that the app can present.
enum Module: String, Identifiable, CaseIterable, Equatable {
    case savanna, ocean, polar
    var id: Self { self }
    var name: String { rawValue }

    var eyebrow: String {
        switch self {
        case .savanna: "Exploring the Savanna"
        case .ocean: "Diving into the Ocean Depths"
        case .polar: "Soaring Through the Polar Regions"
        }
    }

    var heading: String {
        switch self {
        case .savanna: "The Savanna"
        case .ocean: "The Ocean"
        case .polar: "The Polar Regions"
        }
    }

    var abstract: String {
        switch self {
        case .savanna:
            "Step onto the vast savanna, home to majestic wildlife like lions, elephants, and zebras. See how the animals move through the golden grasslands beneath the sun."
        case .ocean:
            "Dive into the depths of the ocean, where you’ll discover diverse marine life, vibrant coral reefs, and the mystery of the deep blue sea, all swirling in an aquatic dance."
        case .polar:
            "Explore the frozen expanse of the Arctic and Antarctic, where icy landscapes and resilient animals like polar bears and penguins thrive in extreme conditions."
        }
    }
    
    var animal: [String] {
        switch self {
        case .savanna: [
            "Giraffe",
            "Lion"
        ]
        case .ocean: [
            "Jellyfish",
            "White Shark",
            "Blue Whale"
        ]
        case .polar: [
            "Polar Bear",
            "Musk Ox",
        ]
        }
    }
    
    var funFacts: [String] {
        switch self {
        case .savanna: [
            "Giraffe are the tallest land animals, reaching up to 5.5 meters in height. They feed on leaves from tree canopies using their long tongues. They live in groups called “towers” and can run up to 55 km/h. Some subspecies are threatened due to habitat loss.",
            "Lion are iconic savanna animals, living in groups called “prides,” mostly made up of females and cubs. They are apex predators, hunting in groups to catch large prey like zebras. Known for their powerful manes, lions symbolize strength and dominance."
        ]
        case .ocean: [
            "Jellyfish are soft-bodied sea creatures found in oceans worldwide. They have umbrella-shaped bodies and long, stinging tentacles to catch prey. Jellyfish drift with ocean currents and vary greatly in size, from tiny to several feet wide.",
            "White sharks are powerful ocean predators, known for their sharp teeth and strong sense of smell. They primarily feed on fish and marine mammals. Found in coastal waters, they play a key role in maintaining ocean health.",
            "The blue whale is the largest animal on Earth, reaching lengths of up to 30 meters. They feed mainly on krill, consuming several tons each day. Despite their massive size, blue whales are gentle giants and are found in oceans worldwide."
        ]
        case .polar: [
            "Polar Bear are large carnivores in the Arctic, primarily hunting seals. Their thick fur and fat keep them warm, and they are strong swimmers. They are threatened by climate change due to melting ice.",
            "Musk oxen are large, shaggy animals native to the Arctic tundra. They have thick coats and form protective circles around their young when threatened. Musk oxen graze on grasses and plants, and their herds help maintain the tundra ecosystem."
        ]
        }
    }
}
