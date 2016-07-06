
# == Schema Information
#
# Table name: player_characters
#
#  id                             :integer          not null, primary key
#  isUsed                         :boolean
#  name                           :string
#  classDnD                       :string
#  level                          :integer          default("1")
#  background                     :string
#  race                           :string
#  alignment                      :string
#  experiencePoints               :integer          default("0")
#  inspiration                    :string
#  proficiencyBonus               :integer
#  armorClass                     :integer
#  initiative                     :integer
#  speed                          :integer
#  currentHitPoints               :integer
#  maxHitPoints                   :integer
#  temporaryHitPoints             :integer
#  totalHitDice                   :string
#  hitDice                        :string
#  deathSaveSuccesses             :integer
#  deathSaveFailures              :integer
#  personalityTraits              :string
#  ideals                         :string
#  bonds                          :string
#  flaws                          :string
#  attacksDescription             :string
#  passiveWisdom                  :string
#  otherProficienciesAndLanguages :string
#  maxEquipmentCarryCapacity      :integer
#  currentEquipmentCarryCapacity  :integer
#  featuresAndTraits              :string
#  age                            :integer
#  height                         :string
#  weight                         :string
#  eyes                           :string
#  skin                           :string
#  hair                           :string
#  characterAppearance            :string
#  characterBackstory             :string
#  additionalFeaturesAndTraits    :string
#  treasure                       :string
#  spellCastingAbility            :string
#  spellSaveDC                    :string
#  spellAttackBonus               :string
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  creator_id                     :integer
#  game_id                        :integer
#



class PlayerCharacter < ActiveRecord::Base

	
	validates :name, presence: true
	validates :classDnD, presence: true
	validates :level, presence: true,numericality: 
		{ only_integer: true, greater_than_or_equal_to: 1,less_than_or_equal_to: 20}

	validates :background,presence: true
	validates :race, presence: true


	has_many :achievement
	belongs_to :creator,
				class_name: "User",
				foreign_key: "creator_id"

	belongs_to :game

	has_many :ability_scores, foreign_key: "playercharacter_id", class_name: "AbilityScore", dependent: :destroy
	has_many :saving_throws, foreign_key: "playercharacter_id", class_name: "SavingThrow", dependent: :destroy
	has_many :skills, foreign_key: "playercharacter_id", class_name: "Skill", dependent: :destroy
	has_many :attack_weapons, foreign_key: "playercharacter_id", class_name: "AttackWeapon", dependent: :destroy
	has_many :armor_and_shields, foreign_key: "playercharacter_id", class_name: "ArmorAndShield", dependent: :destroy
	has_many :equipments, foreign_key: "playercharacter_id", class_name: "Equipment", dependent: :destroy
	has_one :wealth, foreign_key: "playercharacter_id", class_name: "Wealth", dependent: :destroy
	has_many :allies_and_organizations, foreign_key: "playercharacter_id", class_name: "AlliesAndOrganization", dependent: :destroy
	has_many :cantrips, foreign_key: "playercharacter_id", class_name: "Cantrip", dependent: :destroy
	has_many :spells, foreign_key: "player_character_id", class_name: "Spell", dependent: :destroy



	accepts_nested_attributes_for :ability_scores, :saving_throws, :skills, :wealth
	accepts_nested_attributes_for :attack_weapons, allow_destroy: true
	accepts_nested_attributes_for :armor_and_shields, allow_destroy: true
	accepts_nested_attributes_for :equipments, allow_destroy: true
	accepts_nested_attributes_for :allies_and_organizations, allow_destroy: true
	accepts_nested_attributes_for :cantrips, allow_destroy: true
	accepts_nested_attributes_for :spells, allow_destroy: true


end

